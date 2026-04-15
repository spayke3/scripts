#!/usr/bin/env bash


sudo apt update
sudo apt install git-lfs -y

sudo apt update
sudo apt install git-lfs -y

echo "machine gitlab.com" > ~/.netrc
echo "login dtiven13" >> ~/.netrc
echo "password glpat-JV69tChzl09IEXgcAVEt6WM6MQpvOjEKdTo5OHRiYQ8.01.171fsns89" >> ~/.netrc
chmod 600 ~/.netrc  # Important: strict permissions required
rm -rf test2  # Backup your ZIP file first!
git clone https://gitlab.com/dtiven13/test3.git test2-lfs
cd test2-lfs
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
# Setup LFS
git lfs install
git lfs track "*.zip"
git add .gitattributes
git commit -m "Enable LFS"
cd ..
curl -L "https://s08.ooo/v2/IxJCDiMnLjUyJSIkM0BBAi4DMwEDMR4lFzssIDs2ByAzMUEgOzEUQDMQMCMBOyw/MxEwEC8sKQYDFz4EMggsAi8HIUAyNjkfNREeJi4lKSY8LywzOwshDjsAMAsuACEMLyUHLw84IRYjCyAcDwcHHTIWID88LwILIREuDC4HOx8vAy4sEhcwGx4bBkIeCzwGHgM8FCMkNDEjCxVACTghHzInDQYuFx8rIwAvJCFAMxE8EQY5NRshDjURPho0ES8kNRYhOR44LwsJEQc5NBsjKyEAPg4hAAYsLjgeLDQRHg4yJTMsMiUNKzwAPh8mGzk5FyUzDTUHQQEuByADISxBIwMnOUANQAokMzYCICMXPjkDFzA1CS8pDTsxHhwzQAZCOzEHHjMsNCsNMT4eODAeHgk7CDAjFiI5ODEeBQ0wPiAeAyI5IwcCFjskBxY7NjQGOAAhKTw/FD01OCBCJggHFgkXBQYDMQIbAzseAC4WIQgNAC8WIScsMzUkIDsuOCAGAwMVHxInIQcjOAZCIwM0QB4LBRQBAwVAIw0TEw==" -o file1.zip


# Copy your ZIP file back
cp file1.zip test2-lfs

# Add and commit via LFS
cd test2-lfs

git add .
git commit -m "Add ROM zip via LFS"

# Push
git push origin main
