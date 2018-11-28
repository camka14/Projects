#include <iostream>

using namespace std;

int main()
{
	int x;
	cout << "Input number of seconds to convert to hours:minutes:seconds" << endl;
	cin >> x;
	int hrs;
	int min;
	int sec;
	hrs = x/60/60;
	min = x/60%60;
	sec = x%60%60;
	cout << x << " Seconds is equal to "
	<< hrs << ":" << min << ":" << sec << endl;
	return 0;
}