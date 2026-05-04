// 每次有重大更新時，改這個版本號來強制清除舊快取
const CACHE_NAME = 'biz-advisor-v1';

// 離線時也能顯示的靜態資源（GitHub API 資料不快取，因為需要即時性）
const STATIC_ASSETS = [
  './',
  './index.html',
  '../shared/dashboard.css',
];

// ── Install：預先快取靜態資源 ──
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return cache.addAll(STATIC_ASSETS);
    })
  );
  // 新 SW 立即接管，不等舊 SW 退出
  self.skipWaiting();
});

// ── Activate：清除舊版快取 ──
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys =>
      Promise.all(
        keys
          .filter(key => key !== CACHE_NAME)
          .map(key => caches.delete(key))
      )
    )
  );
  // 立即控制所有 client
  self.clients.claim();
});

// ── Fetch：攔截請求 ──
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);

  // GitHub API 請求：永遠走網路，不快取（需要即時資料）
  if (url.hostname === 'api.github.com') {
    event.respondWith(fetch(event.request));
    return;
  }

  // 靜態資源：Network First（有網路就抓新的，斷線才用快取）
  event.respondWith(
    fetch(event.request)
      .then(response => {
        // 抓成功就順手更新快取
        if (response && response.status === 200) {
          const clone = response.clone();
          caches.open(CACHE_NAME).then(cache => {
            cache.put(event.request, clone);
          });
        }
        return response;
      })
      .catch(() => {
        // 網路失敗就從快取拿
        return caches.match(event.request).then(cached => {
          if (cached) return cached;
          // 連快取也沒有的話，回傳離線提示（只針對 HTML 導航請求）
          if (event.request.mode === 'navigate') {
            return caches.match('./index.html');
          }
        });
      })
  );
});
