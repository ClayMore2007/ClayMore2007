#include "Character.h"
#include "Building.h"
#include "Character01.h"
#include "Building01.h"
#include <ctime>

//void Char()
//{
//	Character character(10, 20);
//	character.Attack();
//
//	cout << character.Damage << endl;
//}
//

void Buil()
{
	Building building;
	cout << building.m_SittingRoom << endl;
}

//void GoodGay(Building *building)
//{
//	cout << "goodgay: "<<building->m_SittingRoom << endl;
//	cout << "goodgay: " << building->m_BedRoom << endl;
//}

void test01()
{
	Building building;
	//GoodGay(&building);
}



void test02()
{

	Character01 char01;
	cout << "pm: " << char01.pm << endl;
	cout << "Health: " << char01.Character::Health << endl;

}

void DoSpeak(Building& building)
{
	building.speak();
}

void test03()
{
	Building01 building01;
	DoSpeak(building01);


}

int main()
{
	//Char();
	//Buil();
	//test01();
	//test02();
	//test03();

	// 01 ------------------------------------
	//int num1 = 0;
	//int num2 = 0;
	//int num3 = 0;
	//cout << "num1=";
	//cin >>num1 ;
	//cout << "num2=";
	//cin >> num2;
	//cout << "num3=";
	//cin >> num3;
	//if (num1 > num2)
	//{
	//	if (num1 > num3)
	//	{
	//		cout << "num1"<<endl;
	//	}
	//}
	//else
	//{
	//	if (num2 > num3)
	//	{
	//		cout << "num2" << endl;
	//	}
	//	else
	//	{
	//		cout << "num3" << endl;
	//	}
	//}
	// 02 ------------------------------------------------

	//int a = 10;
	//int b = 20;
	//int c = 0;

	//c = (a > b? a:b);
	//cout <<"c="<< c << endl;
	//(a < b ? a : b) = 100;
	//cout << "a=" << a << endl;

	// 03 ------------------------------------------------
	//srand((unsigned int)time(NULL));
	//int a = rand() % 100 + 1;
	//int b = 0;


	//while (b = a)
	//{
	//	cout << "b=";
	//	cin >> b;
	//	if (b < a)
	//	{
	//		cout << "<a" << endl;

	//	}
	//	else if (b > a)
	//	{

	//		cout << ">a" << endl;
	//	}
	//	else
	//	{
	//		cout << "right!" << endl;
	//		break;
	//	}

	//	
	//}
	// 04 ----------------------------------------------
	//int a = 99;

	//do 
	//{
	//	int b = a % 10;
	//	int c = a / 10 % 10;
	//	int d = a / 100;

	//	int f = b * b * b + c * c * c + d*d*d;

	//	if (a == f)
	//	{
	//		cout << a << endl;
	//	}
	//	a++;

	//} 	while (a < 1000);

	// 05 ---------------------------------------------------
	//for (int i=0 ;i<=100;i++)
	//{
	//	if (i % 7 == 0 || i / 10 == 7 || i % 10 == 7)
	//	{
	//		cout << "!!!" << endl;
	//	}
	//	else
	//	{
	//		cout << i << endl;
	//	}

	//}

	//--------------------------------------------------------

	//int pigArray[5] = { 300,350,200,400,250 };
	//int max = 0;
	//for (int i=0; i <= 4; i++)
	//{
	//	if (pigArray[i] > max)
	//	{
	//		max = pigArray[i];
	//	}
	//}
	//cout << "weight = " << max << endl;

	//-----------------------------------------------------------
	int array[5]{ 1,2,3,4,5 };
	int start = array[0];
	int end = sizeof(array) / sizeof(array[0]);

	cout << end << endl;

	for (int i = 0; i < 5; i++)
	{
		int temp = array[start++];
		array[start++] = array[end--];
		array[end--] = temp;
		cout << array[i] << endl;
		
	}





	//-----------------------------------------------------------
	system("pause");

}