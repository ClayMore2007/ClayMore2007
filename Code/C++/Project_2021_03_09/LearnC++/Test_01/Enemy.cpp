#include <iostream>
#include "Enemy.h"


Enemy::Enemy(int hp,int damage)
{
	HP = hp;
	Damage = damage;
}
Enemy::Enemy()
{
	HP = 10;
	Damage = 1;
}
Enemy::~Enemy()
{

}


void Enemy::Attack()
{
	cout << "play attack animation" << endl;
}
