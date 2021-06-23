#include "Character.h"


Character::Character()
{

}

Character::~Character()
{

}

Character::Character(int health, int damage)
{
	Health = health;
	Damage = damage;
}

void Character::Attack()
{
	cout << "attack" << endl;
}