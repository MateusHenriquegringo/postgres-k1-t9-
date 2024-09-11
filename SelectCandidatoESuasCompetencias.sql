SELECT first_name, last_name, email, description,
  (SELECT STRING_AGG(comp.name, ', ')
     FROM "Candidato_Competencia" AS cand_comp
     JOIN "Competencia" AS comp ON cand_comp.competencia_id = comp.id
     WHERE cand_comp.candidato_id = candidato.id) AS competencias
FROM "Candidato" AS candidato
JOIN "Candidato_Competencia" AS cand_comp ON candidato.id = cand_comp.candidato_id
JOIN "Competencia" AS comp ON cand_comp.competencia_id = comp.id;
