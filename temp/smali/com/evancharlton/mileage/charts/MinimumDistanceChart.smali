.class public Lcom/evancharlton/mileage/charts/MinimumDistanceChart;
.super Lcom/evancharlton/mileage/charts/DistanceChart;
.source "MinimumDistanceChart.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/evancharlton/mileage/charts/DistanceChart;-><init>()V

    return-void
.end method


# virtual methods
.method protected getAxisTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    const v0, 0x7f070084

    invoke-virtual {p0, v0}, Lcom/evancharlton/mileage/charts/MinimumDistanceChart;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected processCursor(Lcom/evancharlton/mileage/charts/LineChart$LineChartGenerator;Landroid/database/Cursor;Lcom/evancharlton/mileage/dao/Vehicle;)V
    .locals 12
    .param p1, "generator"    # Lcom/evancharlton/mileage/charts/LineChart$LineChartGenerator;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "vehicle"    # Lcom/evancharlton/mileage/dao/Vehicle;

    .prologue
    .line 17
    const/4 v6, 0x0

    .line 18
    .local v6, "num":I
    const-wide/16 v2, 0x0

    .line 19
    .local v2, "last_odometer":D
    const-wide v4, 0x40c3880000000000L    # 10000.0

    .line 20
    .local v4, "min_distance":D
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v10

    if-nez v10, :cond_0

    .line 21
    invoke-virtual {p1}, Lcom/evancharlton/mileage/charts/LineChart$LineChartGenerator;->isCancelled()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 36
    :cond_0
    return-void

    .line 24
    :cond_1
    const/4 v10, 0x1

    invoke-interface {p2, v10}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v8

    .line 25
    .local v8, "odometer":D
    if-lez v6, :cond_3

    .line 26
    sub-double v0, v8, v2

    .line 27
    .local v0, "distance":D
    cmpg-double v10, v0, v4

    if-gez v10, :cond_2

    .line 28
    move-wide v4, v0

    .line 30
    :cond_2
    const/4 v10, 0x0

    invoke-interface {p2, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-virtual {p0, v10, v11, v4, v5}, Lcom/evancharlton/mileage/charts/MinimumDistanceChart;->addPoint(JD)V

    .line 32
    .end local v0    # "distance":D
    :cond_3
    move-wide v2, v8

    .line 33
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "num":I
    .local v7, "num":I
    invoke-virtual {p1, v6}, Lcom/evancharlton/mileage/charts/LineChart$LineChartGenerator;->update(I)V

    .line 34
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move v6, v7

    .line 35
    .end local v7    # "num":I
    .restart local v6    # "num":I
    goto :goto_0
.end method
