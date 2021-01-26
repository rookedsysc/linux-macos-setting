# /bin/zsh
# for user

# install
sudo apt-get -y install fail2ban

# fail2ban setting
sudo systemctl enable fail2ban # 자동 실행 설정
sudo systemctl restart fail2ban # fail2ban 실행
