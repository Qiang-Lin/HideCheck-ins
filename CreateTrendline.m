function [fitresult, gof] = CreateTrendline(x, y2)
    [xData, yData] = prepareCurveData( x, y2 );
    % Set up fittype and options.
    ft = fittype( 'poly2' );
    % Fit model to data.
    [fitresult, gof] = fit( xData, yData, ft );
end
