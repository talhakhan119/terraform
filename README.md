Getting Started


First and foremost, you need to have a Hetzner Cloud account. You can sign up for free here.

Then you'll need to have terraform or tofu, packer (for the initial snapshot creation only, no longer needed once that's done), kubectl cli and hcloud the Hetzner cli for convenience. The easiest way is to use the homebrew package manager to install them (available on Linux, Mac, and Windows Linux Subsystem).

brew install terraform # or brew install opentofu
brew install packer
brew install kubectl
brew install hcloud

[Do not skip] Creating your kube.tf file and the OpenSUSE MicroOS snapshot

i ) Create a project in your Hetzner Cloud Console, and go to Security > API Tokens of that project to grab the API key, it needs to be Read & Write. Take note of the key!

ii ) Generate a passphrase-less ed25519 SSH key pair for your cluster; take note of the respective paths of your private and public keys.

iii) Now navigate to where you want to have your project live and execute the following command, which will help you get started with a new folder along with the required files, and will propose you to create a needed MicroOS snapshot. 

    tmp_script=$(mktemp) && curl -sSL -o "${tmp_script}" https://raw.githubusercontent.com/kube-hetzner/terraform-hcloud-kube-hetzner/master/scripts/create.sh && chmod +x "${tmp_script}" && "${tmp_script}" && rm "${tmp_script}"


**Installation**

Now that you have your kube.tf file, along with the OS snapshot in Hetzner project, you can start the installation process:

    cd PROJECT_NAME 

    terraform init --upgrade 

    terraform validate 

    terraform apply -auto-approve 


