function lol(P,V,len)
%% Plotting Surfaces  

%%
% <latex>
% \noindent
% We illustrate the use of Matlab's functionis \verb|surf| and \verb|contour| 
% by plotting the Rosenbrock banana function.
% </latex>

%%
% The Rosenbrock banana function is defined by
% $$
%  z=f(x,y) = 10(y-x^2)^2 + (1-x)^2.
% $$
% The minimum of this function is $z=0$ at $(x,y)=(1,1)$.
%

%%
% <latex>
% STEP ONE: First, we define vectors $x$ and $y$ that specify the discrete rectangular domain over which we  
% want to graph the function. Then we define matrices $X,Y,Z$ where $X(i,j)=x(i)$, $Y(i,j)=y(j)$, and 
% $Z(i,j) = f(X(i,j)),Y(i,j))$, for some function $z=f(x,y)$. 
% </latex>

xmin=-1.5;
xmax=1.5;
delta=0.1;
ymin=-1;
ymax=1.5;

x=[xmin:delta:xmax];
y=[ymin:delta:ymax];  

[X,Y]=meshgrid(x,y);

% The RosenbrockFunction2D function was written with the capability to 
% input two matrices and output a matrix.

Z=RosenbrockFunction2D(X,Y); 




%%
% <latex>
% STEP TWO: Plot the surface $z=f(x,y)$ using the \verb|surf| command. In this plot, 
% color proportional to height. 
% Also, let's mark the minimum with a large magenta dot (located just above the min so we can see it).
% </latex>

%%
% <latex>
% STEP THREE: 
% Once the figure has been made you can manually rotate it. When you are happy with the view you can find out what
% it is by typing \verb|[az,el]=view| and then hard code that if you like using \verb|view(az,el)|.
% </latex>

%%
% <latex>
% STEP FOUR: 
% \emph{Always} use a large enough font, title your figure, label your axes, specify appropriate ticks, and if
% needed tighten up the axes limits.
% </latex>

figure

surf(X,Y,Z)

% You need the following command to add a second plot to the figure.

hold on

plot3(1,1,5,'m.','markersize',30)
%for it = 1:len
  %plot3(P(it,1),P(it,2),V(it),'m.','markersize',30)
%end

hold off

az=170;
el=30;

view(az,el);

hax=gca; % To find out what gca does type: help gca

set(hax,'fontname','helvetica','fontsize',18);

title('Rosenbrock')

xlabel('x')
ylabel('y')
zlabel('z')

ticks=[-2:1:2];

set(hax,'xtick',ticks,'xticklabel',ticks)
set(hax,'ytick',ticks,'yticklabel',ticks)

set(hax,'ztick',[0:10:100],'zticklabel',[0:10:100])

% Tighten up the view

zlim([0,100])

%%
% <latex> \vskip40pt
% Next we make a contour plot of the same function.
% Since the Rosenbrock banana-shaped valley has very steep sides
% we use handpicked contour values, in the vector \verb|V| rather than the
% default equally spaced values. The call to \verb|contour| produces the contour curves
% themselves. \verb|clabel| labels the contours by their height, and \verb|colorbar| adds
% the colorbar. Notice how we set the various attributes of the curves, labels, and color bar
% using \verb|set| calls with the appropriate handles. 
% </latex>

xmin=-2;
xmax=2;
delta=0.01;
ymin=-2;
ymax=2;

x=[xmin:delta:xmax];
y=[ymin:delta:ymax];

[X,Y]=meshgrid(x,y);

Z=RosenbrockFunction2D(X,Y);

% Since Z is a matrix, max(Z) is a vector, so we need max(max(Z)) to maximize Z.

MaxValue=max(max(Z));
DeltaV=5; 
V1=[0:DeltaV:4*DeltaV];
V2=[10*DeltaV:20*DeltaV:MaxValue/2];
V=[V1 V2];

figure

hax=gca;

[c hc]=contour(X,Y,Z,V);

hcl=clabel(c, hc); 
hcb=colorbar;

hold on

plot(1,1,'m.','markersize',30)
for it = 1:len
  plot(P(1,:),P(2,:),'linewidth',1)
end

hold off

set(hax,'fontname','helvetica','fontsize',18);

title('Contour Plot of Rosenbrock')

xlabel('x')
ylabel('y')

ticks=[-2:1:2];

set(hax,'xtick',ticks,'xticklabel',ticks)
set(hax,'ytick',ticks,'yticklabel',ticks)

colorticks=[0:500:2000];

set(hcb,'ytick',colorticks,'yticklabel',colorticks)
set(hcl,'fontname','helvetica','fontsize',18);
set(hc,'linewidth',2);