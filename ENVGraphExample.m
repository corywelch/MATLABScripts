% Script for Grain Size Analysis Curve. The code was written by Carolyn
% Miller, with guidance from Bob McKillop (P.Eng), who willingly provided
% students with an example code. The curve demonstrates the relationship
% between the grain size(mm) and the percent passing (%) of the soil
% tested in the Grain Size Analysis lab. 

clc, clear, format compact, close all 
% Experimental data
% Grain size has units of mm, and percent passing is measured as percents
grain_size = [37.5, 26.5, 22.4, 19.0, 16.0, 9.50, 6.70, 4.75, 2.36,...
              1.18, 0.6, 0.3, 0.15, 0.075];
          
percent_passing = [100, 94.5, 93.6, 92.3, 85.8, 64.4, 47.5, 37.6, 34.7,...
                   32.4, 28.5, 14.3, 4.1, 1.4];
                 
% ----- Plotting the experimental data
%semilogx(grain_size, percent_passing, 'ok', 'markerfacecolor', 'k') 
xlabel('Grain Size (mm)','FontName', 'times new roman')
ylabel('Percent Passing (%)', 'FontName', 'times new roman') 
title('Grain Size Analysis', 'FontName', 'times new roman')
grid on 
set(gca, 'xdir', 'reverse', 'FontName', 'times new roman')

% ----- Interpolating and plotting using pchip
d_plot = linspace(min(grain_size), max(grain_size),100000); 
pp_plot = interp1(grain_size, percent_passing, d_plot,'pchip'); 
hold on 
semilogx(d_plot, pp_plot,'-k', 'linewidth', 2) 
 
% ----- Finding d_50 using interpolation and plotting the result
 d_50 = interp1(percent_passing, grain_size, 50, 'pchip') 
 %semilogx(d_50, 50,'ks', 'markerfacecolor', 'k', 'markersize', 8) 
hold off 

% Changing background figure colour from grey to white
set(gcf, 'color', 'w')
% ----------------------------------------------------------- end of script
