-- rudimentary SQL select statement
-- specifying the table name's schema (dbo) speeds up table retrieval
SELECT PersonId, FirstName, LastName, Email FROM dbo.Person

-- same query permitting dirty reads
SELECT PersonId, FirstName, LastName, Email FROM dbo.Person WITH (NOLOCK)

-- shorthand query permitting dirty reads
SELECT PersonId, FirstName, LastName, Email FROM dbo.Person (NOLOCK)

-- simple join statement requiring both tables to have matching records
-- the shorthand syntax JOIN can be used in place of INNER JOIN
SELECT
      p.FirstName
    , p.LastName
    , ph.Phone
FROM
    dbo.Person AS p
    INNER JOIN dbo.Phone AS ph
        ON p.PersonId = ph.PersonId

-- simple join statement which doesn't require the joining 
-- table (the right table - dbo.Phone) to have matching records
-- the shorthand syntax LEFT JOIN can be used in place of LEFT OUTER JOIN
-- longhad keyword AS to alias the tables names has been dropped
SELECT
      p.FirstName
    , p.LastName
    , ph.Phone
FROM
    dbo.Person p
    LEFT OUTER JOIN dbo.Phone ph
        ON p.PersonId = ph.PersonId