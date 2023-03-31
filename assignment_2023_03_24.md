# Question 1

- The highest normal form for the given relation scheme is 3NF (Third Normal Form).

- To see why, let's analyze the functional dependencies of the relation scheme. From the given functional dependencies, we can identify the following candidate keys:

  - {StudentName, CourseNo}
  - {EnrollmentNo, CourseNo}
- Both of these candidate keys are composed of more than one attribute, which means that there is a potential for partial dependencies.

- We can see that there is a partial dependency of EnrollmentNo on StudentName, since StudentName → EnrollmentNo. To remove this partial dependency, we can create a new relation scheme with attributes {StudentName, EnrollmentNo} and a primary key of {StudentName}.

- Now, let's check for transitive dependencies. We can see that there is a transitive dependency of Grade on StudentName through EnrollmentNo, since StudentName → EnrollmentNo and EnrollmentNo → Grade. To remove this transitive dependency, we can create a new relation scheme with attributes {EnrollmentNo, Grade} and a primary key of {EnrollmentNo}.

- Therefore, the resulting relation schemes are:

      StudentPerformance1(StudentName, CourseNo, Grade)
      with a primary key of {StudentName, CourseNo}

      StudentPerformance2(StudentName, EnrollmentNo)
      with a primary key of {StudentName}

      StudentPerformance3(EnrollmentNo, Grade)
      with a primary key of {EnrollmentNo}

  All three relations are in 3NF and there are no further partial or transitive dependencies.

# Question 2

-  To find all candidate keys, we need to find the minimal set of attributes that uniquely determines all other attributes in the relation. We can use the given functional dependencies to identify the candidate keys:

        CE → D, D → B: CE+ → ABCDE
        CE → D, C → A: CE+ → ABCDE
    Both {CE} and {CD} are candidate keys.

- To identify the best normal form that R satisfies, we need to check for partial dependencies and transitive dependencies. We can see that there is a partial dependency of D on {CE}, since CE+ determines all attributes in the relation. Therefore, R is not in 2NF.

- To decompose R into BCNF, we can create two new relations based on the partial dependency of D on {CE}:

      R1(C, E, D) with functional dependency CE → D
      R2(D, B) with functional dependency D → B

- Both R1 and R2 are in BCNF, since their non-prime attributes are each functionally dependent on their respective candidate keys. We can see that the candidate keys for R1 are {CE} and {CD}, and the candidate key for R2 is {D}.

- Therefore, the final decomposed relations are:

      R1(C, E, D) with a primary key of {CE, C}
      R2(D, B) with a primary key of {D}

  Both R1 and R2 are in BCNF.


# Question 3

## (a)

- To find all keys of R based on the given functional dependencies, we can use the closure of attribute sets. Starting with each attribute, we can find its closure under the given functional dependencies until we have a closure that includes all attributes of R. Any attribute set that has a closure including all attributes of R is a superkey of R. If a superkey has no proper subset that is also a superkey, then it is a candidate key.

- Starting with A, we have A+, which includes A, B, C, D, E, and F because of the following functional dependencies:

      ABC → D
      ABD → E
      CDF → B (by transitivity, since CD → F and CDF → B)
      BF → D (by transitivity, since ABC → D and ABD → E)
  Since A+ includes all attributes of R, {A} is a superkey of R.

- Starting with B, we have B+, which includes B, D, and F because of the following functional dependencies:

      ABC → D (by transitivity, since BF → D and ABC → BF)
      BF → D
  We can't add any more attributes to B+ while still keeping it a superkey, so {B} is a candidate key of R.

- Starting with C, we have C+, which includes C, D, E, F, and B because of the following functional dependencies:

      CD → F
      CDF → B (by transitivity, since CD → F)
  Since C+ includes all attributes of R, {C} is a superkey of R.

- Starting with D, we have D+, which includes D and B because of the following functional dependencies:

      ABC → D
      ABD → E
      CDF → B (by transitivity, since CD → F and CDF → B)
      BF → D (by transitivity, since ABC → D and ABD → E)
  We can't add any more attributes to D+ while still keeping it a superkey, so {D} is a candidate key of R.

- Starting with E, we have E+, which includes E and A, B, C, D, and F because of the following functional dependencies:

      ABD → E
      ABC → D
      CDF → B (by transitivity, since CD → F and CDF → B)
      BF → D (by transitivity, since ABC → D and ABD → E)
- We can't add any more attributes to E+ while still keeping it a superkey, so {E} is a candidate key of R.

- Starting with F, we have F+, which includes F and B, C, and D because of the following functional dependencies:

      CD → F
      CDF → B (by transitivity, since CD → F)
  We can't add any more attributes to F+ while still keeping it a superkey, so {F} is a candidate key of R.

- Therefore, the set of candidate keys for R is {B, D, E, F}.

## (b)
- This relation is not in Boyce-Codd Normal Form (BCNF) because there are non-trivial functional dependencies where the determinant is not a superkey. For example, CD → F is a non-trivial dependency where CD is not a superkey.

- However, this relation is in third normal form (3NF) because every non-trivial functional dependency has a determinant that is either a superkey or a candidate key.


# Question 4

| Advantages of Normalization | Disadvantages of Normalization |
| --- | --- |
| 1. Eliminates Data Redundancy: Normalization reduces data redundancy by organizing data into separate tables. | 1. Increases Complexity: Normalization can lead to an increase in the complexity of the database schema, making it harder to understand and maintain. |
| 2. Improves Data Consistency: Normalization ensures that data is consistent across the database by removing duplicate data. | 2. Slower Query Performance: Normalization can lead to slower query performance due to the need to join multiple tables together. |
| 3. Facilitates Database Maintenance: Normalization makes it easier to maintain the database schema by reducing the need for changes to be made in multiple locations. | 3. Increased Storage Requirements: Normalization can result in an increase in storage requirements due to the need for additional tables. |
| 4. Enhances Data Integrity: Normalization improves data integrity by enforcing rules that prevent inconsistencies and errors. | 4. Difficulty in Implementing: Normalization can be difficult to implement, especially in cases where the data is complex or there are many interrelated tables. |


# Question 5

The given schema is R = (S, T, U, V), and the dependencies are S → T, T → U, U → V, and V → S. We need to find a decomposition R1 and R2 such that R1 ∩ R2 ≠ ∅. 

To find the decomposition, we can follow these steps:
1. Find the minimal cover of the given functional dependencies.
2. Check if the decomposition satisfies the lossless join property and the dependency preservation property.

The minimal cover of the given functional dependencies is S → T, T → U, U → V, and V → S. 

    Let R1 = (S, T, U) and R2 = (U, V). Then, R1 ∩ R2 = (U).

To check if the decomposition satisfies the lossless join property, we need to compute the natural join of R1 and R2 on their common attribute U. If the result is not equal to R, then the decomposition is not lossless.

    R1 ⋈ R2 = (S, T, U, V), which is not equal to R = (S, T, U, V).

Therefore, the decomposition is not lossless.

To check if the decomposition satisfies the dependency preservation property, we need to compute the closures of the functional dependencies in R1 and R2. If the closures do not include all the functional dependencies in R, then the decomposition does not preserve dependencies.

    S+ = {S, T, U, V}
    T+ = {T, U, V, S}
    U+ = {U, V, S, T}
    V+ = {V, S, T, U}

All the functional dependencies in R are present in the closures of R1 and R2. Therefore, the decomposition satisfies the dependency preservation property.

In conclusion, the decomposition R1 = (S, T, U) and R2 = (U, V) satisfies the dependency preservation property but does not satisfy the lossless join property.

