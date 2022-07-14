require 'socket'



def show_console_image()
    puts "                      __                         "
    puts "______   ____________/  |_  _____ _____  ______  "
    puts "\____ \ /  _ \_  __ \   __\/     \\__  \ \____ \ "
    puts "|  |_> >  <_> )  | \/|  | |  Y Y  \/ __ \|  |_> >"
    puts "|   __/ \____/|__|   |__| |__|_|  (____  /   __/ "
    puts "|__|                            \/     \/|__|    "
end


def scan_for_common_ports(ip)
    port = [21, 22, 80, 443, 3306, 5432, 8080]
    time = Time.new
    show_console_image()
    puts "PORTMAP started at: #{time.inspect}"
    puts ""
    puts ""

    for i in port
        begin
            host = ip
            socket = TCPSocket.new(host, i)
            rest = "open"
            print "#{time.inspect}  "
            print "\033[0;0m["
            print "\033[1;92m#"
            print "\033[0;0m]"
            puts " Port \033[1;92m#{i}\033[0;0m is \033[1;92m#{rest}\033[0;0m"
        rescue Errno::ECONNREFUSED, Errno::ETIMEOUT
            rest = "closed"
            print "#{time.inspect}  "
            print "\033[0;0m["
            print "\033[1;91m#"
            print "\033[0;0m]"
            puts " Port \033[1;91m#{i}\033[0;0m is \033[1;91m#{rest}\033[0;0m"
        end
    end
    puts ""
    puts "PORTMAP exited at: #{time.inspect}"
    exit(0)
end

scan_for_common_ports("45.33.32.156")