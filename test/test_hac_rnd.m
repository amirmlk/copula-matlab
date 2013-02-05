%#ok<*DEFNU>
%#ok<*STOUT>

function test_suite = test_hac_rnd
initTestSuite;

function testFlatHacClaytonRnd
    U = hac.rnd('clayton', {1, 2, 3, 4, 5 1.5}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_copula_rnd_clayton.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
   
function testFlatHacGumbelRndAgainstMatlab
    U = hac.rnd('gumbel', {1 2 1.5}, 1000);
    assertInRange(U, 0, 1);
    X = copularnd('gumbel', 1.5, 1000);
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);

function testFlatHacFrankRnd
    U = hac.rnd('frank', {1 2 3 4 5 1.5}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_copula_rnd_frank.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0); 
    
function testFlatHacJoeRnd
    U = hac.rnd('frank', {1 2 3 4 5 1.5}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_copula_rnd_joe.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function testHacGumbel3DRnd
    U = hac.rnd('gumbel', {1, {2, 3, 2.0}  1.25}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_gumbel3d.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function testHacFrank3DRndWithAlphaMoreThan1
    U = hac.rnd('frank', {1, {2, 3, 2.0}  1.25}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_frank3d_1.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function IGNORE_testHacFrank3DRndWithAlphaLessThan1
    U = hac.rnd('frank', {1, {2, 3, 0.75}  0.5}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_frank3d_2.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
  
function testHacClayton3DRnd
    U = hac.rnd('clayton', {1, {2, 3, 2.0}  1.25}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_clayton3d.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function testHacJoe3DRnd
    U = hac.rnd('joe', {1, {2, 3, 2.0}  1.25}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_joe3d.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function IGNOREtestHacGumbel7DRnd
    U = hac.rnd('gumbel', {{1, 2, 1.3}, {3, 4, {5, 6, 7 2.2} 1.4}, 1.15}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_gumbel7d.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function IGNOREtestHacFrank7DRndWithAlphaMoreThan1
    U = hac.rnd('frank', {{1, 2, 1.3}, {3, 4, {5, 6, 7 2.2} 1.4}, 1.15}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_frank7d_1.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
 function IGNOREtestHacFrank7DRndWithAlphaLessThan1
    U = hac.rnd('frank', {{1, 2, 0.9}, {3, 4, {5, 6, 7 0.7} 0.5}, 0.3}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_frank7d_2.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function IGNOREtestHacClayton7DRnd
    U = hac.rnd('clayton', {{1, 2, 1.3}, {3, 4, {5, 6, 7 2.2} 1.4}, 1.15}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_clayton7d.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function IGNOREtestHacJoe7DRnd
    U = hac.rnd('joe', {{1, 2, 1.3}, {3, 4, {5, 6, 7 2.2} 1.4}, 1.15}, 1000);
    assertInRange(U, 0, 1);
    X = csvread('data/test_hac_rnd_joe7d.csv');    
    H = mvkstest2(U, X);
    assertEqual(sum(H), 0);
    
function assertInRange( X, x1, x2 )
    assertEqual(sum(sum(X < x1)), 0);
    assertEqual(sum(sum(X > x2)), 0);
    