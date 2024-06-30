library(ggplot2)
rna <- read.csv("rna.csv")
rna$LgPvalue <- -log10(rna$pvalue)
rna <- rna[order(rna$LgPvalue),]
pdf("./rna_path.pdf")
ggplot(rna,aes(
  x = factor(Description,levels = unique(Description)),
  y = LgPvalue)) +
  geom_col(width = 0.75,fill="#7584BA")+
  theme_bw()+
  theme(panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        panel.border = element_blank(),
        legend.title = element_blank(),
        axis.line.x = element_line(color='black'),
        axis.line.y = element_line(color='black'),
        axis.text.x = element_text(color = "black", size = 25),
        axis.title.x = element_text(color = "black", size = 25),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank())+
  coord_flip()+scale_y_continuous(position = "right",expand = c(0,0))+
  geom_text(data = rna,aes(x=Description, y=0.1, label=Description),
            hjust=0, size=8)+
   xlab(" ")
dev.off()
