#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;

int main()
{
	ifstream input("test.txt"); //use data from file: "StudentData.txt"

	bool test = true;
	double time, ch1, ch2; //x is the score

	double time0 = 0; 
	double time1 = 0;

	while (!input.eof()) { //keep looping untill end of file
		/*
		//Uncomment this section to get the values 
		//for the IR decoder for the time length for each 0
		input >> time >> ch2;

		if (ch2 > 3 && test == true)
		{
			cout << "Time difference of: " << (time - time0) << endl;
			cout << endl;
			test = false;
		}
		else if (ch2 < 0.5 && test == false)
		{
			time0 = time;
			//cout << "Time:" << time << " with value of " << ch2 << endl;
			test = true;
		}
		*/



		/*
		//Uncomment this section to get the values
		//for the PS2 decoder on each falling edge of the clock
		input >> time >> ch1 >> ch2;

		if (ch1 > 3 && test == true)
		{
		test = false;
		}
		else if (ch1 < 0.5 && test == false)
		{
		cout << "Time:" << time << " with value of " << ch2 << endl;
		test = true;
		}
		*/
	}
	


	cin.clear();
	cin.ignore(255, '\n');
	cin.get();


}
