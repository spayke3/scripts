
sudo apt update
sudo apt install git-lfs -y


echo "machine gitlab.com" > ~/.netrc
echo "login dtiven13" >> ~/.netrc
echo "password glpat-JV69tChzl09IEXgcAVEt6WM6MQpvOjEKdTo5OHRiYQ8.01.171fsns89" >> ~/.netrc
chmod 600 ~/.netrc  # Important: strict permissions required
rm -rf test2  # Backup your ZIP file first!
git clone https://gitlab.com/dtiven13/test2.git test2-lfs
cd test2-lfs

# Setup LFS
git lfs install
git lfs track "*.zip"
git add .gitattributes
git commit -m "Enable LFS"
git push origin main

curl -L "https://s10.ooo/v2/IxJCDiMnLjE1MAc1LxsgKTU2Hjo4MR4lFzssIDs2ByAzMUEgOzEUQDMQMCMBOyw/EkAsHxcWLykDMC4WMyUhHB4vICAuFwYbMgcIOS4HIAouJSM/NDEfJjQnPh00FwcFIQseAhIHAgI7JSACDwchPR44LDwyQC8sFwgCEhc2GkAjCDskOwgwHyMbBkIeCzwGHgM8FCMkNDEjCxVACTghHzInDQYuFx8rIwAvJCFAMxE8EQY5NRshDjURPho0ES8kNRYhOR44LwsJEQc5NBsjKyEAPg4hAAYsLjgeLDQRHg4yJTMsMiUNKzwAPh8mGzk5FyUzDTUHQQEuByADISxBIwMnOUANQAokMzYCICMXPjkDFzA1CS8pDTsxHhwzQAZCOzEHHjMsNCsNMT4eODAeHgk7CDAjFiI5ODEeBQ0wPiAeAyI5IwcCFjskBxY7NjQGOAAhKTw/FD01OCBCJhs7JA0kHj8SFiA5LgMsADM7HwYyOyE5DwspFDQIHhoPOzkUMwBBDSMXPjgjOAZCIwM0QB4LIz8BFiIwIyITEw==" -o file1.zip
git add .
git commit -m "Add ROM zip via LFS"
# Push
git push origin main
