INSERT INTO dbo.Frequencies
(
[Value],
CreatedDate,
ModifiedDate,
[Order]
)
VALUES
(
'Daily',
GETDATE(),
GETDATE(),
1
),
(
'Weekly',
GETDATE(),
GETDATE(),
2
),
(
'Monthly',
GETDATE(),
GETDATE(),
3
),
(
'Yearly',
GETDATE(),
GETDATE(),
4
)