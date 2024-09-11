SELECT vaga.name, city, vaga.description, created_at,
  (SELECT STRING_AGG(comp.name, ', ')
     FROM "Vaga_Competencia" AS vaga_comp
     JOIN "Competencia" AS comp ON vaga_comp.competencia_id = comp.id
     WHERE vaga_comp.vaga_id = vaga.id) AS competencias
FROM "Vaga" AS vaga
JOIN "Vaga_Competencia" AS vaga_comp ON vaga.id = vaga_comp.vaga_id
JOIN "Competencia" AS comp ON vaga_comp.competencia_id = comp.id;