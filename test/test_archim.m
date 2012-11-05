%#ok<*DEFNU>
%#ok<*STOUT>

function test_suite = test_archim 
initTestSuite;

function testArchimndiff
% Test n-th derivative of a function with comparing analytical ndiff with
% normal diff
    X = [0.1 0.2; 0.2 0.8; 1.0 0.4; 0.5 0.0];
    assertElementsAlmostEqual(archimndiff('clayton', 1, X, 1.2), archimdiff('clayton', X, 1.2))
    assertElementsAlmostEqual(archimndiff('frank', 1, X, 1.2), archimdiff('frank', X, 1.2))
    assertElementsAlmostEqual(archimndiff('gumbel', 1, X, 1.2), archimdiff('gumbel', X, 1.2))
    
function testArchimpdf
% Tests 2 dimensional case of archimpdf with copulapdf
    X = [0.1 0.2; 0.3 0.8; 1.0 1.0; 0.5 0.5];
    assertVectorsAlmostEqual(archimpdf('clayton', X, 1.0), copulapdf('clayton', X, 1.0));
    %assertVectorsAlmostEqual(archimpdf('frank', X, 1.5), copulapdf('frank', X, 1.5));
    assertVectorsAlmostEqual(archimpdf('gumbel', X, 1.5), copulapdf('gumbel', X, 1.5));
    
function testArchimfitGumbel
% Tests 2 dimensional case of archimfit on copulafit
    X = uniform(normrnd(0, 1, 10000, 2));
    [ alpha1 ] = archimfit('gumbel', X);
    [ alpha2 ] = copulafit('gumbel', X);
    assertVectorsAlmostEqual(alpha1, alpha2, 'absolute', 0.0001);    
    
function testArchimfitFrank
% Tests 2 dimensional case of archimfit on copulafit
    X = uniform(normrnd(0, 1, 10000, 2));
    [ alpha1 ] = archimfit('frank', X);
    [ alpha2 ] = copulafit('frank', X);
    assertVectorsAlmostEqual(alpha1, alpha2, 'absolute', 0.0001);
    
function testArchimfitClayton
% Tests 2 dimensional case of archimfit on copulafit
    X = uniform(normrnd(0, 1, 10000, 2));
    [ alpha1 ] = archimfit('clayton', X);
    [ alpha2 ] = copulafit('clayton', X);
    assertVectorsAlmostEqual(alpha1, alpha2, 'absolute', 0.0001);


