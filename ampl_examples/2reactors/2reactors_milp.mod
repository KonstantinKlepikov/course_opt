# �������� ������������� ���������� ������ � ������ ��������
set REACTORS; # ��������� ���������

param cost_proc {REACTORS}; #���������� ������� �� �����������
param fixed_proc {REACTORS}; #���������� ������� �� �����������

param cost_rm; #��������� �����

param conversion {REACTORS}; #������� ����������� � ��������

param yield; # ��������� ������������������ �� ��������

param bigM; # ������� ����� ��� ���������� x -> y

var x {r in REACTORS} >=0 ; # ������ ������� ���������
var y {r in REACTORS} binary; # ����� ���������

# ������� ������� - ������� ���������� ������ (����� + �����������)
minimize TotalCost:
	sum {r in REACTORS} (cost_proc[r] * x[r] + fixed_proc[r] * y[r]) 
			+ cost_rm * sum {r in REACTORS} x[r];

subject to Yield:
	sum {r in REACTORS} conversion[r] * x[r] = yield;
	
subject to Select {r in REACTORS} :
	x[r] <= bigM * y[r];


data;

param :	REACTORS :	cost_proc	fixed_proc	conversion :=
		r1			1.74		4.72	0.8
		r2			1.18		3.83	0.667;
		
param yield := 10;
param cost_rm := 5;
param bigM := 20;

end;