

class A
{
	float test;

public:

	int* p;

	A(int a, int b, int c)
	{
		test = 0;


	}

	A(float a, float b, float c)
	{
		test = 1;
	}
	~A()
	{
		delete p;
	}
};





class CopyTestClass
{
public:
	int data;

};

static CopyTestClass* p;


class ClassManger
{
public:

	CopyTestClass* p[10];

	int NUM() { return currentCount; }
	int currentCount = 0;
public:

	void RecordNewPtr(CopyTestClass* newptr)
	{
		p[currentCount] = newptr;
		++currentCount;
	}

	CopyTestClass*GetPtrFromIndex(int index)
	{
		return p[index];
	}

};

static ClassManger m;

static int C = 10;

static char* p = "This is my Name in ";
// Sets default values



void NewFunct()
{
	if (m.currentCount > 0)
	{
		m.GetPtrFromIndex(0);

	}

}

int main()
{
	CopyTestClass* newptr = new CopyTestClass();

	m.RecordNewPtr(newptr);

	NewFunct();

}

void Swap(int a, int b)
{
	//a 交换 b;
}

void Swap(int* a, int* b)
{
	//(*a) = *b;
	// (*b) = *a;
	//*a 交换 *b;
}

int main()
{ 
	int number1 = 5;
	int number2 = 15;

	Swap(number1, number2);


	//number1 = 15?
	//numbue2 = 5?


	//number1 = 5;
	//numbuer2 = 15;

}


	//构造函数
	//函数重载
	//虚函数


	//1.构造
	//2.赋值
	//3.析构
	
	//1.
	CopyTestClass b;//构造
	//b.data = 0;


	{
		//2.
		CopyTestClass c; //构造
		//析构
	}

	//3.
	CopyTestClass d = b;  //构造

	//4
	d = b; //赋值

	//5.
	CopyTestClass* testPtr = new CopyTestClass();

}