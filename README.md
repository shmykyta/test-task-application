# Flask app with auto-deployment

This is a cool new website what should coming soon.

## Structure

Source code based in the src directory.
Dockerfile for building docker image placed in the root directory.
For containers orchestration prospective used docker-compose file with the nginx reverse proxy and application itself. 
There no DNS records, so temporary used GCP instance IP address for access to the web-site.

## Access to deploy

Developers should have access to the dev group in GCP IAM for ability connect to the remote instance. If they don't need to contact with DevOps team to provide it.

## Init for deploymnet

- Download gcloud util
```bash
brew update
brew cask install google-cloud-sdk
```
- Connect to the project via your google email `gcloud auth login` and follow the instructions.

## Deployment process

Steps to delivery your changes to remote server:
1. Create pull request and pass code review from colleagues
2. Merge your changes to the `main` branch
3. Run `deploy.sh` script to auto delivery to the remote server in GCP
4. If your changes not deliver or script don't working contact DevOps team

### Technology stack:
- docker
- docker-compose
- python3.8
- nginx
- Flask