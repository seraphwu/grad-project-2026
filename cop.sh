# 一次處理名單
users=(aliceyyjweb jessica6817 katiewuhua emily650359 yunyunyunyyyyy hsiaoting0517 Beckymiao yuqing915 weihsien0820 NINCHANG)

for user in "${users[@]}"; do
  echo "Adding $user..."
  gh api repos/seraphwu/grad-project-2026/collaborators/$user -X PUT
done