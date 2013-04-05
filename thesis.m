
%% Copula densities

% Independence copula
gen.copulaimg(@(U) prod(U, 2), '../Images/independence-cdf.pdf');

% Comonotonicity copula
gen.copulaimg(@(U) min(U, [], 2), '../Images/comonotonicity-cdf.pdf');

% Countermonotonicity copula
gen.copulaimg(@(U) max(sum(U, 2) - 1, 0), '../Images/countermonotonicity-cdf.pdf');

% Guassian copula
gen.copulaimg(@(U) copulapdf('gaussian', U, 0.3), '../Images/gaussian-pdf.pdf', 20, 0.05, 0.95);

% Student-t copula
gen.copulaimg(@(U) copulapdf('t', U, 0.3, 3), '../Images/student-pdf.pdf', 20, 0.05, 0.95);

% Clayton copula
gen.copulaimg(@(U) copulapdf('clayton', U, 0.7), '../Images/clayton-pdf.pdf', 30, 0.05, 0.95);

% Gumbel copula
gen.copulaimg(@(U) copulapdf('gumbel', U, 1.3), '../Images/gumbel-pdf.pdf', 20, 0.05, 0.95);

% Frank copula
gen.copulaimg(@(U) copulapdf('frank', U, 2.0), '../Images/frank-pdf.pdf', 20, 0.05, 0.95);

%% Positive and negative dependency scatter

U = copularnd('gumbel', 2.5, 500);
U1 = 1 - U(:,1);
U2 = U(:,2);

archim.fit('gumbel', [U1 U2]);

fig = figure(1);
set(fig, 'Position', [0, 0, 1000, 250]);


sub1 = subplot(1,3,1);
scatter(U1, U2, '.');
set(gca, 'FontName', 'NewCenturySchlbk');
xlabel(sub1, 'U1', 'FontName', 'NewCenturySchlbk');
ylabel(sub1, 'U2', 'FontName', 'NewCenturySchlbk');

sub2 = subplot(1,3,2);
scatter(1 - U1, U2, '.');
set(gca, 'FontName', 'NewCenturySchlbk');
xlabel('1 - U1', 'FontName', 'NewCenturySchlbk');
ylabel('U2', 'FontName', 'NewCenturySchlbk');


sub3 = subplot(1,3,3);
scatter(U1, 1 - U2, '.');
set(gca, 'FontName', 'NewCenturySchlbk');
xlabel('U1', 'FontName', 'NewCenturySchlbk');
ylabel('1 - U2', 'FontName', 'NewCenturySchlbk');

%set(sub1,'Units','normalized', 'position', [0.05 0.12 0.4 0.8]);
%set(sub2,'Units','normalized', 'position', [0.58 0.17 0.35 0.7]);

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [16 4]);
set(gcf, 'PaperPosition', [0 0 16 4]);
print('-dpdf', '-r300', '../Images/rotating-negative-dependence.pdf');
