function [SSE] = bgrowthSSE(lambda,theta,alpha)

Ti=linspace(0,2.5,6);
Nexp=[0.00,0.09,0.15,0.26,0.40,0.70];

dNdt =@(N) lambda*N*(1-(N/theta)^alpha); 
dxdt = @(t,x)[dNdt(x(1));];

[Tsim,Xsim]=ode45(dxdt,Ti,0.08);
SSE=sum((Xsim.'-Nexp).^2);
end