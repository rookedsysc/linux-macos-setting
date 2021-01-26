# About 
리눅스 ssh 보안에 관련된 간단한 가이드 라인.

# SSH 기본 포트 변경
	sudo vi /etc/ssh/sshd_config

> &#36; Port 22 <br>
> Port 원하는 포트 지정<br>
> service start # 데몬 재구동

# fail2ban
로그인 실패 횟수를 감지해서 로그인 시도를 차단해주는 tool인듯.<br>

## 설치 
	wget https://raw.githubusercontent.com/rookedsysc/Linux_MacOS_Setting/master/Linux_SSH_Protect/fail2ban.sh
	sh fail2ban.sh

## 설정 파일 수정
> [참조 사이트 1](https://goddaehee.tistory.com/272) <br>

## 꿀팁 
기본 설정파일에 설정내용 작성시 추후 **업데이트시 모두 초기화**됨. 따라서 개인화 설정 파일 **/etc/fail2ban/jail.local** 파일을 만들어 설정해주는 것이 좋음.

	sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
	sudo vi /etc/fail2ban/jail.local

mac-air kali에 내 개인 설정 파일 있음.

# 방화벽 설정
> [참조사이트](https://code1018.tistory.com/63)


