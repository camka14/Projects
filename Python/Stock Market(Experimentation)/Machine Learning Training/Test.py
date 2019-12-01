def insSort(arr):
    sorArr = [0]*len(arr)
    sorArr[0] = arr[0]
    for i in range(1,len(arr)):
        j = 0
        num = arr[i]
        for k in range(j,-1,-1):
            print(sorArr[k])
            if sorArr[k] > num:
                sorArr[k+1] = sorArr[k]
            else:
                sorArr[k] = num
                j += 1
                break
    return sorArr

insSort([2.1])