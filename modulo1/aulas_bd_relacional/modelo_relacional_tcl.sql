START TRANSACTION;

select @sal:=min(Salario) from Empregado;

INSERT INTO Empregado (MatEmp, NomEmp, EndEmp , CidEmp, Bairro, Cargo, Sexo, Comissao, Salario, SalarioBruto, CodDepto, CodSupervisor) 
VALUES (23, 'Maria Ramos', 'Rua Y', 'Belo Horizonte', 'Savassi', 'Presidente', 'F', 10, @sal, @sal, 1, null);

COMMIT;
