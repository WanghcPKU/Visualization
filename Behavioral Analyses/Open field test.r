library(ggplot2)
library(ggdensity)
library(ggblanket)
library(RColorBrewer)
library(viridis)
colormap <- colorRampPalette(rev(brewer.pal(11,'Spectral')))(32)

##可以对数据进行标准化
standardize <- function(a) {
  mean_val <- mean(a, na.rm = TRUE)
  sd_val <- sd(a, na.rm = TRUE)
  standardized_a <- (a - mean_val) / sd_val
  return(standardized_a)
}

df <- read.csv("./df.csv")
df <- na.omit(df)


ggplot(df,aes(x = X, y = Y)) +
stat_density2d(aes(fill=log2((..density..))), geom="raster", contour=FALSE,n=500)+
 scale_fill_gradientn(colours=colormap,limits = z_range)+ theme(legend.position = "none")+
            theme(
panel.grid.major = element_blank(),
panel.grid.minor = element_blank(),
panel.background = element_blank()
)+
theme(axis.title.x = element_blank(),  # 隐藏 x 轴标题
    axis.text.x = element_blank(),   # 隐藏 x 轴标签
    axis.ticks.x = element_blank(),  # 隐藏 x 轴刻度线
    axis.title.y = element_blank(),  # 隐藏 y 轴标题
    axis.text.y = element_blank(),   # 隐藏 y 轴标签
    axis.ticks.y = element_blank())
    
    
##如果有需要绘制两个或更多需要统一颜色标尺 如上面代码所示z_range 示例如下 

ct <- read.csv("./ct.csv")
ct <- na.omit(ct)

p1 <- ggplot(df,aes(x = X, y = Y)) +
stat_density2d(aes(fill=log2(standardize(..density..)+1)), geom="raster", contour=FALSE,n=500)+
 scale_fill_gradientn(colours=colormap)
plot_build_p1 <- ggplot_build(p1)
p1_density <- plot_build_p1$data[[1]]
head(p1_density)

p2 <- ggplot(ct,aes(x = X, y = Y)) +
stat_density2d(aes(fill=log2(standardize(..density..)+1)), geom="raster", contour=FALSE,n=500)+
 scale_fill_gradientn(colours=colormap)
plot_build_p2 <- ggplot_build(p2)
p2_density <- plot_build_p2$data[[1]]
head(p2_density)

z_range <- range(c(log2(p1_density$density)), log2((p2_density$density)), na.rm = TRUE)

