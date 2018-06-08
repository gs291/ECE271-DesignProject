/***************************************
* Affiliation: Oregon State University
* Author: Gregory Sanchez
*
* Course: ECE 271 - Digital Logic Design
* Project Name: ECE 271 Final Project
* Team Number: 09
*
* Description: Data Parser
* Start Date: 06/05/2018
*
****************************************/
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;

/*
*	Function: The CSV data must be copied into a text document
*							named "test.txt". The code parsers the text document
*							whether the IR or PS/2 needs to be parsed
*	Inputs:		text file
*	Outputs:	Parsed information that can be copied to a new text document
*
*
*/
int main()
{
	ifstream input("test.txt"); //use data from file: "text.txt"

	bool test = true;
	double time, ch1, ch2;

	double time0 = 0;

	while (!input.eof()) { //keep looping untill end of file
		/*
		//Uncomment this section to get the values
		//for the IR decoder for the time length for each 0
		input >> time >> ch2;

		if (ch2 > 3 && test == true)
		{
			cout << "Time " << time << " of " << ch2 << endl;
			cout << endl;
			//cout << "Time difference of 1: " << time << " - 0: " << time0 << " is : " << (time - time0) << endl;
			//cout << endl;
			test = false;
		}
		else if (ch2 < 0.5 && test == false)
		{
			time0 = time;
			cout << "Time " << time0 << " of " << ch2 << endl;
			cout << endl;
			//cout << "Time difference of 0: " << time << " - 1: " << time0 << " is : " << (time - time0) << endl;
			//cout << endl;
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
