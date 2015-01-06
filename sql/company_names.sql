SPARQL
DEFINE input:same-as "yes"
DEFINE input:inference <http://dbpedia.org/ontology/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
SELECT ?s ?o FROM <http://company.dbpedia.org/> {
	?s a <http://dbpedia.org/ontology/Company> .
	?s foaf:name ?o .
};
