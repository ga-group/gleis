SPARQL
DEFINE input:inference <http://dbpedia.org/ontology/>
DEFINE input:same-as "yes"
PREFIX lei: <http://www.leiroc.org/data/schema/leidata/2014/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
CONSTRUCT {?company ?p ?person} WHERE {
	GRAPH <http://datahub.io/dataset/legal-entities> {?company a lei:LEI .}
	{
		{
			BIND (<http://dbpedia.org/ontology/keyPerson> as ?p)
			GRAPH <http://company.dbpedia.org/> {?company ?p ?res .}
		} UNION {
			BIND (<http://dbpedia.org/ontology/chairman> as ?p)
			GRAPH <http://company.dbpedia.org/> {?company ?p ?res .}
		} UNION {
			BIND (<http://dbpedia.org/property/founder> as ?p)
			GRAPH <http://company.dbpedia.org/> {?company ?p ?res .}
		}
		{
			?res <http://dbpedia.org/property/viaf> ?x .
		} UNION {
			?res <http://de.dbpedia.org/property/viaf> ?x .
		}
		BIND(IRI(CONCAT('http://viaf.org/viaf/', ?x)) AS ?person)
	}
};
