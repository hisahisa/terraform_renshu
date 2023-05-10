# terraform_renshu

- 初期設定

 1. terraform init

- 必要環境を作成して選択
 2. terraform workspace new &{環境}
    - 環境
        - dev
        - stg
        - prd 
 3. terraform select &{環境}

- s3バケット作成(最初にs3を作成が必須。なぜならsqs作成時にs3リクエスト許可の設定でs3-arnを必要とするから。)

 3. terraform plan -target=module.s3_bucket_main
 4. terraform apply -target=module.s3_bucket_main

- sqsとs3のeventを作成

 5. terraform plan
 6. terraform apply
