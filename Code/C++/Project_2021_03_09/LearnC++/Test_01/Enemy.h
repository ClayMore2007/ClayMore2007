#pragma once
#include <iostream>

using namespace std;

class Enemy
{
public:
	Enemy();
	~Enemy();

	Enemy(int hp, int damage);
public:
	int HP;
	int Damage;
	void Attack();

private:

};
