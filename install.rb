#!/usr/bin/ruby

def dir_exist(dir)
	File.exists? File.expand_path(dir)
end

def copy(dir1, dir2)
	cmd = "cp #{dir1} #{dir2}"
	system(cmd)
end

def packet_manager
	if dir_exist('/usr/bin/apt-get')
		return "apt"
	elsif dir_exist('/etc/pacman.conf')
		return "pacman"
	end
end


def install_stuff
	if packet_manager == "apt"
		system('apt-get install i3 zsh vim & sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"') 
	elsif packet_manager == "pacman"
		system('pacman -S i3 zsh vim & sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"' )
	end
end

def copy_cfg
	if !dir_exist('~/.i3')
		exec('mkdir ~/.i3')
	end
	copy('i3/config', '~/.i3/config')
	copy('vim/.vimrc', '~/.vimrc')
	copy('zsh/.zshrc','~/.zshrc')
end

def start
	puts "Press 1 to install , 2 to merge the config"
	whato = gets.chomp.to_i

	if whato == 1
		install_stuff
	elsif whato == 2
		copy_cfg
	else
		puts "Error"
	end
end

start
