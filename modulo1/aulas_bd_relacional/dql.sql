use pos_puc_mod_1_aulas;

select * from Empregado;

select NomEmp, MatEmp from Empregado
where MatEmp between 0 and 1000;

SELECT 
	NomEmp, 
	Salario, 
	Comissao, 
	Salario + Comissao as SalarioMensal,
	12*(Salario + Comissao) 'SalarioAnual'
FROM Empregado;

