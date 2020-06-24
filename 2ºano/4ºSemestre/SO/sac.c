void disk_save(int PID,int x,int valor_x){
	if(DISKpointer<5){
		Disk[DISKpointer][0]=PID;
		Disk[DISKpointer][1]=x;
		Disk[DISKpointer][2]=valor_x;
	}
}

int disk_load(int PID,int x){
	for(int i=0;i<5;i++){
		if(Disk[i][0]==PID && Disk[i][1]==x){
			return Disk[i][2];
		}
	}
	return -1;
}

void Set_x(int posI,int x1,int x2){
	MEM[posI+x2]=MEM[posI+x1];
}

void Set_n(int posI,int x,int n){
	MEM[posI+x]=n;
}

void Inc_x(int posI,int x){
	MEM[posI+x]=MEM[posI+x]+1;
}

void Dec_x(int posI,int x){
	MEM[posI+x]=MEM[posI+x]-1;
}

