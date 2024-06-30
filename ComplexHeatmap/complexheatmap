library(ComplexHeatmap)

fpkm_genes <- read.csv("oxidative_gene.csv")
head(fpkm_genes)
rownames(fpkm_genes) <- fpkm_genes$X
fpkm_genes <- fpkm_genes[,c(2:5)]

exp <-t(scale(t(fpkm_genes))) # 标准化

bk <- c(seq(-2.5,-0.1,by=0.01),seq(0,2.5,by=0.01))
color = c(colorRampPalette(c("#6488c0","white"))(length(bk)/2),colorRampPalette(c("white","#d6413d"))(length(bk)/2))

#保存聚类结果 但是不显示聚类
#ro <- Heatmap(exp) 
#exp_order <- exp[row_order(ro),]

p <- Heatmap(exp,border=T ,row_names_side = "right",
width = ncol(exp)*unit(25, "mm"),show_row_names = T,
height = nrow(exp)*unit(5, "mm"),cluster_rows = F, cluster_columns = F,
col = color,rect_gp = gpar(col = "white", lwd = 1), # 边框
 column_names_rot = 45,
  # 设置行标签字体大小
  column_names_gp = gpar(
    fontsize = 12
  ),    
  row_names_gp = gpar(
    fontsize = 12
  ))

#可以给需要标注的行进行注释
#annotation <- c("SOD3","GPX4")
#genes <- as.data.frame(annotation)
#p + rowAnnotation(link = anno_mark(at = which(rownames(exp) %in% genes$annotation), 
                                      #labels = rownames(exp)[which(rownames(exp) %in% genes$annotation)], labels_gp = gpar(fontsize = 15)))

