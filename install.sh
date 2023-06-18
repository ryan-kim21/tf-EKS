#!/bin/bash
cat ~/.aws/config
cat ~/.aws/credentials


sudo apt update
sudo apt install awscli -y

aws configure set aws_access_key_id [] --profile default
aws configure set aws_secret_access_key [] --profile default
aws configure set region ap-northeast-2 --profile default


curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client



source <(kubectl completion bash) # bash-completion 패키지를 먼저 설치한 후, bash의 자동 완성을 현재 셸에 설정한다
echo "source <(kubectl completion bash)" >> ~/.bashrc # 자동 완성을 bash 셸에 영구적으로 추가한다

alias k=kubectl
complete -o default -F __start_kubectl k


curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

aws eks --region ap-northeast-2 update-kubeconfig --name test-eks-cluster



aws iam create-role \
  --role-name test-ryan-eks-role \
  --assume-role-policy-document file://trust-policy.json

policy.json



aws iam create-policy \
  --policy-name test-ryan-eks-role \
  --policy-document file://policy.json



aws iam attach-role-policy \
  --role-name test-ryan-eks-role \
  --policy-arn arn:aws:iam::960524191939:policy/test-ryan-eks-role









eksctl utils associate-iam-oidc-provider --region=ap-northeast-2 --cluster=test-eks-cluster --approve


#aws load balancer controller iam 생성
eksctl --profile default\
   --region=ap-northeast-2 \
  delete iamserviceaccount \
  --name aws-load-balancer-controller \
  --namespace kube-system \
  --cluster test-eks-cluster 


#rollbing
eksctl --profile default\
       --region=ap-northeast-2 \
        create iamserviceaccount \
        --name aws-load-balancer-controller \
        --namespace kube-system \
        --override-existing-serviceaccounts \
        --approve --cluster test-eks-cluster \
        --attach-policy-arn \
        arn:aws:iam::960524191939:policy/test-alb-iam-policy


eksctl-test-eks-cluster-addon-iamserviceacco-Role1-1Q8C86HI7DS1F

aws iam detach-role-policy --role-name eksctl-test-eks-cluster-addon-iamserviceacco-Role1-1Q8C86HI7DS1F --policy-arn arn:aws:iam::960524191939:policy/test-alb-iam-policy


