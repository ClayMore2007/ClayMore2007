#pragma once
#include <iostream>

using namespace std;

class Character
{
public:
	Character();
	~Character();
	Character(int health, int damage);

public:
	int Health;
	int Damage;
	void Attack();
};