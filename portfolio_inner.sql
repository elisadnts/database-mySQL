use dtb_sistema_faculdade;

SELECT tbl_alunos.nome, tbl_alunos.numero_matricula , tbl_cursos.nome_curso FROM tbl_alunos INNER JOIN tbl_cursos on tbl_alunos.id_curso = tbl_cursos.id;


SELECT tbl_materia_curso.id_materia, tbl_materia_curso.id_curso, tbl_materia.nome_materia, tbl_cursos.nome_curso 
FROM tbl_materia_curso INNER JOIN tbl_materia ON tbl_materia_curso.id_materia = tbl_materia.id
INNER JOIN tbl_cursos ON tbl_cursos.id = tbl_materia_curso.id_curso ;

SELECT tbl_alunos.nome , tbl_endereco.logradouro, tbl_endereco.cep FROM tbl_alunos INNER JOIN tbl_endereco ON tbl_alunos.id = tbl_endereco.id_aluno;