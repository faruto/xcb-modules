#
# Copyright (c) 2013-2015, Dalian Futures Information Technology Co., Ltd.
#
# Bo Wang     <futurewb at dce dot com dot cn>
# Xiaoye Meng <mengxiaoye at dce dot com dot cn>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
# for file in $(ls *.txt); do tail -n 22 $file | Rscript hsv.R; done
#

library(fGarch)

da = read.csv(file("stdin"), header = F)
m1 = garchFit(~garch(1, 1), data = diff(log(da$V3)), trace = F)
cat(as.character(da[1, 2]), "=", predict(m1, 1)$standardDeviation * sqrt(252), "\n", sep = "")

