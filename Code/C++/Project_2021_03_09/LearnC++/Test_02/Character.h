#pragma once
#include <iostream>
using namespace std;

class Character

{
public:

	Character();
	~Character();

	Character(int hp, int damage);

	void Attack();

public:
	int Health;
	int Damage;

};