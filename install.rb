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

def install_i3
	if packet_manager == "apt"
		system("apt-get install i3")
	elsif packet_manager == "pacman"
		system("pacman -S i3")
	end
end

def install_zsh
	if packet_manager == "apt"
		system("apt-get install zsh")
	elsif packet_manager == "pacman"
		system("pacman -S zsh")
	end
	system('sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" ')
end



def install_stuff
	if !dir_exist('/usr/bin/i3')
		install_i3
	end

	if !dir_exist('~/.i3')
		exec('mkdir ~/.i3')
	end
	
	if !dir_exist('/usr/bin/zsh')
		install_zsh
	end

end

def copy_cfg
	copy('i3/config', '~/.i3/config')
	copy('vim/.vimrc', '~/.vimrc')
	copy('zsh/.zshrc','~/.zshrc')
end


install_stuff
copy_cfg

