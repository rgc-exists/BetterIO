var testingRead = betterIO_open_read("TestingRead.txt")

var l = 0;
var testReal = 0;
while(l < 5){
	testReal += betterIO_read_real(testingRead)
	betterIO_readln(testingRead)
	l++;
}
show_message(string(testReal))
while(!betterIO_eof(testingRead)){
	show_message(betterIO_read_string(testingRead))
	betterIO_readln(testingRead)
	l++;	
}