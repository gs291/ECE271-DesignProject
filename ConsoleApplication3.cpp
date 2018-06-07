#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;

int main()
{
	ifstream input("test.txt"); //use data from file: "StudentData.txt"

	int start = 0;
	bool test = true;
	double time, ch2; //x is the score

	double time0 = 0; 
	double time1 = 0;

	double count = 0;

	while (!input.eof()) { //keep looping untill end of file

						   //get first name, last name, and score for the line
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
	}


	cin.clear();
	cin.ignore(255, '\n');
	cin.get();


}
