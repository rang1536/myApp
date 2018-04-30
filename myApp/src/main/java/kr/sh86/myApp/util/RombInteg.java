package kr.sh86.myApp.util;

import java.io.*;

public class RombInteg{
	public static void getInteg() throws IOException{
		System.out.println("Enter the trial number\n");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String str = br.readLine();
		int N = Integer.parseInt(str);
		
		double[] T; 
		T = new double[N+1];
		double[][] R; 
		R = new double[N+1][N+1];
		
		for(int i=0; i<=N; i++){
			T[i] = 0;
		}
		double a = 0; double b = 1;
		double h; int num = 1;
		T[0] = (b-a)*0.5*(f(a)+f(b));
		for(int i=0; i<N; i++){
			h = (b-a)/(2*num);
			for(int j=1; j<=num; j++){
				T[i+1] += h*f(a+(2*j-1)*h);
			}
			num *= 2;
			T[i+1] += 0.5*T[i];
		}
		for(int i=0; i<=N; i++){
			R[i][0] = T[i];
		}
		for(int j=1; j<=N; j++){
			for(int i=j; i<=N; i++){
				R[i][j] = (Math.pow(4.,j)*R[i][j-1]-R[i-1][j-1])/(Math.pow(4.,j) - 1);
			}
		}
		System.out.println(R[N][N]);
	}
	public static double f(double x){
		return 4./(1+x*x);
	}
}
