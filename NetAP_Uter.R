

affNetNMI = matrix(0,1,10)
affNetAR = matrix(0,1,10)
affNetRI = matrix(0,1,10)
affNetCHI = matrix(0,1,10)
affNetPV = matrix(0,1,10)


#s1 = corSimMat(uterine,method="pearson");

#uterRes = matrix(0,1,248)

for (k in 3:12)
{
  
  maxNMI = 0
  maxAR = 0
  maxRI = 0
  maxCHI = 0
  minPV = 100000
  print(k)
      for (qv in seq(0.1,0.95,0.05))
      {
        apres <- apcluster(s=lung_sis, q=qv)
        aggres <- aggExCluster(lung_sis, apres)
        clu = cutree(aggres,k)
        
        
        for(i in 1:k)
        {
          for(j in 1:length(clu@clusters[[i]]))
          {
            canberra[clu@clusters[[i]][[j]]] =  i;
            
          }
        }
        
        nmi = calNMI(canberra,label_7)
        rnd = RRand(canberra,label_7)
        pear = chisq.test(canberra,label_7)
       
        if(nmi>maxNMI)
        {
          maxNMI = nmi
          
          print (nmi)
        }
        
        if(rnd[1]$Rand>maxAR)
        {
          maxAR = rnd[1]$Rand
        }
      
        if(rnd[2]$adjRand>maxRI)
        {
          maxRI = rnd[2]$adjRand
        }
        if(pear[1]$statistic>maxCHI)
        {
          maxCHI = pear[1]$statistic
        }
        if(pear[3]$p.value<minPV)
        {
          minPV = pear[3]$p.value
        }
        
        
      }
  
  affNetNMI[1, k-2] = maxNMI
  affNetAR[1, k-2] = maxAR
  affNetRI[1, k-2] = maxRI
  affNetCHI[1, k-2] = maxCHI
  affNetPV[1, k-2] = minPV
  
}


