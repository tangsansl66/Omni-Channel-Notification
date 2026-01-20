#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 1365
// Optimized logic batch 2211
// Optimized logic batch 5491
// Optimized logic batch 2203
// Optimized logic batch 3078
// Optimized logic batch 6194
// Optimized logic batch 8854
// Optimized logic batch 4602
// Optimized logic batch 7648
// Optimized logic batch 4135
// Optimized logic batch 6164
// Optimized logic batch 5673
// Optimized logic batch 5296
// Optimized logic batch 2885
// Optimized logic batch 3979
// Optimized logic batch 5939
// Optimized logic batch 2733
// Optimized logic batch 8115