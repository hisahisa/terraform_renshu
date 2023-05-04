# terraform_renshu

- 初期設定

 1. terraform init

- s3バケット作成(最初にs3を作成が必須。なぜならsqs作成時にs3リクエスト許可の設定でs3-arnを必要とするから。)

 2. terraform plan -target=module.s3_bucket_main
 3. terraform apply -target=module.s3_bucket_main

- sqsとs3のeventを作成

 4. terraform plan
 5. terraform apply
