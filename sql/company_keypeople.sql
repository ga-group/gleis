SPARQL
DEFINE input:inference <http://dbpedia.org/ontology/>
DEFINE input:same-as "yes"
PREFIX lei: <http://www.leiroc.org/data/schema/leidata/2014/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
CONSTRUCT {?company ?p ?person} {
	GRAPH <http://datahub.io/dataset/legal-entities> {?company a lei:LEI .}
	{
		BIND (<http://dbpedia.org/ontology/keyPerson> as ?p)
		GRAPH <http://company.dbpedia.org/> {?company ?p ?person .}
	} UNION {
		BIND (<http://dbpedia.org/ontology/chairman> as ?p)
		GRAPH <http://company.dbpedia.org/> {?company ?p ?person .}
	} UNION {
		BIND (<http://dbpedia.org/property/founder> as ?p)
		GRAPH <http://company.dbpedia.org/> {?company ?p ?person .}
	}
};
